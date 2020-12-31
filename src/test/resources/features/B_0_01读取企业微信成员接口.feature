Feature: ["读取人员接口"]

  Scenario Outline: 读取人员接口_正向測試
    Given API "/cgi-bin/user/get"
    And Param
    """
    access_token: ${getToken}
    userid: CuiZhongYuan
    """
    When GET
    Then STATUS "200"
    Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
    Examples:
      | jsonPath | value  |
      | errmsg   | ok |

  Scenario Outline: 读取人员接口_逆向测试（缺少token鉴权，期望的错误）
    Given API "/cgi-bin/user/get"
    And Param
    """
    access_token:
    userid: CuiZhongYuan
    """
    When GET
    Then STATUS "200"
    Then JSONPATH_ASSERT "<jsonPath>" equals "<value>"
    Examples:
      | jsonPath | value  |
      | errcode   | 41001 |