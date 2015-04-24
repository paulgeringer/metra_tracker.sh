###Usage###
 `metra_tracker <TRAIN_LINE> <DEPARTURE> <DESTINATION> [<TRAIN '#'>]`

 See the `train_keys.txt` file for the list of available train lines and
 station values. You must use the key value that's in all caps. I haven't
 written anything to fuzzy match inputs.

 The optional `TRAIN #` is not the train number that metra designates its trains with, but rather which train from the list that's returned, starting with 1.
 It defaults to use train 1, which is the next train. I will probably add something to display all upcoming trains.
