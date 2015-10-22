#!/usr/bin/python

import sys
import glob
import re
# ["filename", "arg0", "arg1"]
dataset_dir = sys.argv[1]

unsw_loc = (-33.9172238, 151.2302268)

for user_dir in glob.glob(dataset_dir + "/users/*"):
    line = None
    latitude = None
    longitude = None
    username = None
    suburb = None

    with open(user_dir + "/details.txt") as fh:
        for line in fh.readlines():
            longitude_match = re.search(r"^home_longitude: (\S+)", line)
            if longitude_match:
                longitude = longitude_match.group(1)

    print(longitude)

def distance_from_unsw(latitude, longitude):
    return sqrt((latitude - unsw_loc[0]) ** 2 + (longitude - unsw_loc[1]) ** 2)