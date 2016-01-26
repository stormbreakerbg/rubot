module Rubot
  module Commands
    class Unknown < Rubot::Command
      NO_COMMAND = /\s*/.freeze
      ARE_YOU_HERE_COMMAND = /(тука? ли си|тук\?)/.freeze
      PUNCTUATION_COMMAND = /(?<command>[\s\.!@?]*)/.freeze
      UNKNOWN_COMMAND = /(?<command>.*)/.freeze

      NO_COMMAND_RESPONSES = [
        'Тук съм.',
        'Тук съм, споко.',
        'Дааа?',
        'Искаш ли нещо?',
        'Слушам.',
        'Слушам те.',
        'Старшина Рубов се явява по служба!',
        'ZZZzzzzzz... А? Кой смее да ме събуди от вечния ми сън?',
      ].map(&:freeze).freeze

      PUNCTUATION_COMMAND_RESPONSES = [
        'Не го разбирам това твоето `%s`',
        'Не мога да те разбера. Това `%s` на какъв език е?',
        'Какви са тези символи дето ми пращаш? `%s` ще ми вика...',
      ].map(&:freeze).freeze

      UNKNOWN_COMMAND_RESPONSES = [
        'Какво трябва да значи `%s`?',
        'Не го разбирам това твоето `%s`',
        'Не мога да те разбера, честно. Какво е `%s`?',
        'Извинявай, но не мога да парсна `%s` :(',
        'Уважаеми господине/госпожо. Моля Ви да извините невежеството ми, но аз съм само един ' \
          'беден бот и не разбирам какво ми казвате. `%s` за мен не означава нищо.',
      ].map(&:freeze).freeze

      command NO_COMMAND do |client, data, _|
        client.say channel: data.channel,
                   text: NO_COMMAND_RESPONSES.sample
      end

      command ARE_YOU_HERE_COMMAND do |client, data, _|
        client.say channel: data.channel,
                   text: NO_COMMAND_RESPONSES.sample
      end

      command PUNCTUATION_COMMAND do |client, data, match|
        client.say channel: data.channel,
                   text: PUNCTUATION_COMMAND_RESPONSES.sample % match[:command]
      end

      command UNKNOWN_COMMAND do |client, data, match|
        client.say channel: data.channel,
                   text: UNKNOWN_COMMAND_RESPONSES.sample % match[:command]
      end
    end
  end
end
