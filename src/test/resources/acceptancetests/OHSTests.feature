Feature: OHS Tests

  Scenario: As a system (FWMT Gateway) I can receive final outcome of cases from TM
    Given TM sends a "LMS" case outcome to the Job Service
    And the response contains the outcome and caseId
    Then the message will be put on the queue to RM
    And the message is in the RM composite format

  @OHS
  Scenario Outline: Process OHS Requests From RM
    Given RM sends OHS <jobs> <type> case samples to the Gateway
    Then loaded in TM <jobs>

  Examples:
  |type|jobs|
  |"create"|1|
  |"cancel"|5|
