Feature: Flydubai


  Scenario: Get FlyDubai FZ 728 depart time

    Given opened "KBP" page
    When I open online schedule

    When I open Arrival schedule
    Then I get arrival time for "FZ 727" flight

    When I open Departure schedule
    Then I get depart time for "FZ 728" flight

