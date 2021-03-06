# Copyright 2012-2013 Amazon.com, Inc. or its affiliates. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License"). You
# may not use this file except in compliance with the License. A copy of
# the License is located at
#
#     http://aws.amazon.com/apache2.0/
#
# or in the "license" file accompanying this file. This file is
# distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF
# ANY KIND, either express or implied. See the License for the specific
# language governing permissions and limitations under the License.

# language: en
@simpledb
Feature: Amazon SimpleDB

  I want to use Amazon SimpleDB

  Scenario: CRUD
    Given I create a SimpleDB domain
    And I put an item "key" with attributes:
    """
    [{"Name": "attr1", "Value": "value1"}]
    """
    And I get the item "key"
    Then the result should have attribute "attr1" with "value1"
    And I delete the domain

  Scenario: SELECT * statements
    Given I create a SimpleDB domain
    And I put an item "key" with attributes:
    """
    [{"Name": "attr1", "Value": "value1"}]
    """
    And I select "*" from the domain
    Then the select result should contain the item
    And I delete the domain

  Scenario: Error handling
    Given I create a domain with no name
    Then the error code should be "InvalidParameterValue"
