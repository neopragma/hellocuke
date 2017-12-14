Feature: Say hello
  As a friendly person
  I want to say hello to the world
  So everyone will be happy

  Scenario Outline: Saying hello
    Given I meet someone who speaks <language>
    When I say hello
    Then the greeting is <greeting>

    Examples:
    | language | greeting              |
    | English  |  "Hello, World!"      |
    | Spanish  |  "¡Hola, mundo!"      |
    | Japanese |  "こんにちは世界"       |
    | Russian  |  "привет, мир!" |
    | French   |  "Bonjour, monde!"    |
    | Italian   |  "Ciao mondo!"    |
    | German   |  "Hallo, Welt!" |
    | Klingon   |  "qo' vlvan!"    |

  Scenario: Saying hello
    Given I meet someone who speaks English
    When I say hello
    Then the greeting is "Hello, World!"

