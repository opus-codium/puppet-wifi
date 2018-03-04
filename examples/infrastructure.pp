# https://www.youtube.com/watch?v=bLE7zsJk4AI

wifi::infrastructure { 'Rocketjump GGGGG':
  psk => '3 words all uppercase',
}

wifi::infrastructure { 'Rocketjump Five Gee':
  psk => 'threee words all uppercase',
}

wifi::infrastructure { 'Rocketjump 5 and then the letter G':
  psk => 'THREE WORDS',
}

wifi::infrastructure { 'Rocketjump 5, Gee!':
  psk => '3 WORDS ALL UPPERCASE',
}

wifi::infrastructure { 'Rocketjump Eff Aiye Vee Ee Gee':
  psk => 'THREEWORDS',
}

wifi::infrastructure { 'Rocket, Jump 5, G':
  psk => 'threewordsalluppercase',
}

wifi::infrastructure { 'The One That Says 5G':
  psk => '3wordsalluppercase',
}
