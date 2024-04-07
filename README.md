# FarmerStemmerChallenge
Farmer Stemmer

# Requirements

1. Text Input Handling: Accept text input from the user. This can include a single word or multiple words separated by spaces.

2. Word Analysis: Upon receiving input, the application must analyze each word to determine possible stem words, following these grammatical rules

The following are common suffixes in the language, remove the suffix to find the root word
	"L"
	"LZ"
	"EVM" 
  "ZQ"
These suffixes require adding back letters to determine the root word:
	remove "PZL" add “A”
	remove "PZL" add "AZ"
	remove "EZL" add "R"

3. Non-Alphabetic Character Handling: The application must ignore any non-alphabetic characters present in the input.

4. Tracking Stem-Words: Keep a record of all stem-words that have been identified and count how many times each stem has been presented as a possible root to a user-input word.

5. Displaying Stem-Words and Counts: See all calculated stem-words along with the number of times each has been calculated as the root of user-input words.

6. Reset Functionality: Allow users to clear the counts of stem words.

# Overview solution

The approach used to address this challenge involved adopting TDD for crafting the word analysis algorithm. Initially, after verifying the algorithm's effectiveness, it was moved into its own module to enhance modularity, and augmenting its maintainability, scalability, and reusability. Making FarmerStemmer a protocol give us the ability to test the functionality easly and ensured that any future modifications to the stemWords algorithm would not impact the clients.

On the client side, a caching mechanism was introduced, leveraging the file system to store all stemmed words, allowing users the capability to purge this cache as needed.

The architectural design used was MVVM, with SwiftUI managing the user interface components.

# Set up the project

To get started, simply clone this repository and launch the application. Within the app, you'll find a text field accompanied by an 'Analyze' button. This setup initiates the stemming process based on the provided input, and the results are displayed in a list that shows the original word, the stemmed word, and the frequency of each stemmed word's occurrence, ordered by the most recently analyzed stemmed word. In the navigation view, users will find a trash icon that can be used to remove the current stem-word data from the disk

![Simulator Screenshot - iPhone 15 Pro - 2024-04-07 at 06 49 26](https://github.com/torrh85/FarmerStemmerChallenge/assets/16314266/acb78810-279e-4ece-acfc-b317d7d0b9e5)

# The hours spent on the exercise

8 hours
