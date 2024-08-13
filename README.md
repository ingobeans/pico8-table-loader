# Pico-8 Table Loader
A tool to load tables from strings in Pico-8 with the intention of saving tokens. The `load_table` function itself uses 239 tokens so it will only save tokens if your tables take up more than that.
Basically this lets your tables only take up character space and barely any tokens. It does support sub tables.
# How to use
Add the `load_table` function to your cart. Enclose your table with \[\[ and \]\] making it a multi line string.
You can then load the now string version of the table back in to a real table with `load_table(s)`.

Ex:
From: ```s = {
  health=1,
  data={
    greeting="hello!"
  }
}```
To: ```s = [[{
  health=1,
  data={
    greeting="hello!"
  }
}]]
s = load_table(s)```
