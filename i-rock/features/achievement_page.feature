Feature: Achievement Page
    In order to read others achievements
    As a guest
    I want to see public achievement

    Scenario: guest user sees public achievement
        Given I am a guest user
        And There is a public achievement
        When I go to the achievement's page
        Then I must see achievement's content
