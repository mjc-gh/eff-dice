#### EFF Dice

A Ruby program for [EFF Dice-Generated
Passphrases](https://www.eff.org/dice). This program has been written to
maximize readability and human understanding.

##### Usage

1. Download this code from Github. It includes the wordlist for ease of
   use.
2. Run `ruby eff_dice.rb` to generate a 5 word passphrase.
   - You can optionally pass an argument to this program that will be
     used as the number words to include in the passphrase. For example,
     to generate 8 words, run `ruby eff_dice.rb 8`.

##### Examples

```
$ ruby eff_dice.rb
guidable antirust batboy divinely pulverize unbolted

$ ruby eff_dice.rb 8
scarce bullish reword unmade shining overreach shorts certainly
```
