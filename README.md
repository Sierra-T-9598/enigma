# ENIGMA 🧩

Welcome to my command line interface, encryption and decryption tool.

Use the two runner files, `encrypt.rb` and `decrypt.rb` to execute
encryption and decryption of a message contained in `message.txt`.

Ruby (v. 2.7.2)

## HOW TO ‍👨‍💻

[Install Ruby!](https://www.ruby-lang.org/en/documentation/installation/)

1. Run the "encrypt" runner file in your terminal with the command:
`ruby ./lib/encrypt.rb message.txt encrypted.txt`

  This will take the message already in the message file and create its
  encryption in the 'encrypted.txt'.

2. Run the "decrypt" runner file in your terminal with the command:
`ruby ./lib/decrypt.rb encrypted.txt decrypted.txt <key used for encryption>
<date used for encryption>`

  This will take the encrypted message and decrypt it to the 'decrypted.txt'.
  🟡 Note: You will be required to provide four command line arguments for
  decryption: 2 text files & the key and date printed to your terminal after
  running the encryption.

## SELF ASSESSMENT ✔️
Based on the Enigma - Evaluation Rubric, I have completed all the requirements
to meet expectations.

  ### Functionality
  + ✔️ #encrypt and #decrypt are successfully implemented in the Enigma class.
  + ✔️ Running encryption and decryption from the CLI is successfully implemented.

  ### Object Oriented Programming
  + ✔️ I broke the project down into logical components, starting small to make
  the ultimate Enigma class functionality
    + KeyMaker
    + OffsetMaker
    + ShiftFinder
    + Enigma
  + ✔️ All classes are reasonably sized and have a pre-determined responsibilities
  surrounding a given functionality.
    + KeyMaker takes in a key and/or generates one before generating a hash with
    4 keys corresponding to A,B,C,D.
    + OffsetMaker takes in a date and/or generates today's date before calculating
    offsets that correspond to an A,B,C, or D key.
    + ShiftFinder takes in the KeyMaker hash and OffsetMaker hash and adds their
    values together to create a new hash with the final shift amounts for each.
    + Enigma is akin to a puzzle. It needs a KeyMaker, an OffsetMaker, and a ShiftFinder,
    in order to first encrypt a message with the given shifts and then decrypt the message
    using the same shifts, the key, and the date used for encryption.

  ### Ruby Conventions and Mechanics
  + ✔️ Code is properly indented, spaced, and lines are not over 76.
  + ✔️ All class, method, variable, and file names follow convention
  + ✔️ Most of the enumerables and data structures chosen are the most efficient
  + ✔️ Implemented multiple hashes in a logical manner
    + KeyMaker, OffsetMaker, and ShiftFinder classes all result in hashes that
    work together to keep track of and generate the A,B,C,D shifts.

  ### Test Driven Development
  + ✔️ Every class has a spec file and every method within a class is completely
  tested to verify the expected behavior.
  + ✔️ At the integration level, the KeyMaker, OffsetMaker, and ShiftFinder are all
  put to the test in the functioning of the Enigma class, and subsequently the
  functioning of the command line interface.
  + ✔️ Edge cases like, characters outside of the alphabet array, uppercased messages,
  and shift amounts of any possible amount (i.e. max of 99 + 9 = 108) are addressed.
  + ✔️ git history shows that I wrote all tests first, prior to working with
  implementation code.
  + ✔️ Simple cov shoes coverage at 100%

  #### Version Control
  + Total commits:
  + Uses logical pull request workflow.

  #### Score I would give myself: 3
