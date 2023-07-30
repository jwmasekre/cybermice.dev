---
title: "Determining Latitude/Longitude using Shadows and Date/Time"
date: 2023-07-29T11:36:00-05:00
weight: 10
---

I was inspired to figure this out because someone I know online posted a video of some cctv, and I wanted to see if I could determine where the cctv was. Google was surprisingly hostile; most sources I found simply said "You don't have enough information" or wanted to invert the date/time for lat/long, which would require a guess-and-check method. I'm writing this inline with my work, so there may still be some guess-and-check but I know it shouldn't be that much.

## The physics

I happen to have a friend who is an astrophysicist, so I can get a pretty good explanation from him regarding how this works, and then translate that for this guide. The math requires some trigonometry (this is based on angles after all), so if you want to have a full mathematical understanding of this, some brushing up on high school/college math may be required. If you don't care, or this is too much math, you can safely skip this section and still be effective.

### Definitions

We'll start with some definitions:

* **Zenith**: Straight out from the center of the earth at our specific point on earth. In this case, straight through the object.
* **Zenith Angle**: The angle between the Zenith and the Sun. If you imagine the object and shadow as the two sides of a right triangle (with the line between the top of the object and the end of the shadow being the hypotenuse)
* **Equinox**: This is the point when the sun is directly over the Earth's equator. It's also the exact midpoint between the Summer Solstice and the Winter Solstice. Autumnal (fall) and Vernal (spring) are identical in terms of sun's location.
* **Solstice**: The point when the sun is as far north or as far south as it gets, relative to the equator. In the northern hemisphere, the northern Solstice is considered the summer Solstice, and the southern one is the winter Solstice. This is inverted in the southern hemisphere.
* **Solar Noon**: The point when the sun is highest in the sky for the day. Note that solar noon varies based on how far you are from the Royal Observatory in Greenwich, London; this means that that solar noon happens sooner the further west you go and later the further east you go. This *also* means that Daylight Savings Time pushes Solar Noon an hour later.
* **Declination**: How far north or south the sun is at any given time during the year. This ranges from 23.44 degrees during the June Solstice, 0 during the March and September Equinoxes, and -23.44 degrees during the December Solstice. Note that we use the name of the month, because the seasons are inverted in the norther hemisphere and the southern hemisphere.

### Solar Noon and Equinox

We'll start with the easiest situation: Solar Noon on the Equinox. This is the easiest way to determine Latitude: since the sun is directly over the equator, at the equator the Zenith Angle is 0, which matches the Latitude. This also means that at the poles, the Zenith angle is 90, which matches the Latitude there. We can infer then that the Zenith Angle at Solar Noon is equal to the Latitude of our location. To find the Zenith Angle, we use Soh-Cah-Toa: in this case, the Opposite line is the shadow, and the Adjacent line is the object. The equation then is `tan(Zenith Angle) = shadow length/object length`; isolating Zenith Angle looks like `Zenith Angle = arctan(shadow length/object length)`. Note, `arctan` on calculators usually looks like `tan^-1`. So if your shadow is 6ft. and your object is also 6ft., `arctan(6/6) = arctan(1) = 45`, so the latitude is 45 degrees.

What about longitude? This is where the time of the image comes into play. For simplicity's sake, we're assuming that time zones are equivalent in size; we can account for variations in time zone locations as we add complexity to this equation. Our time zones adjust time in one hour chunks, so we can assume Solar Noon is somewhere between noon and 1300 (again, reality is a bit more complex than this, and actually +/-1hr is more realistic, but we're simplifying the calculation for explaining the math). To calculate how far from the zero point we are, we can just take the time of Solar Noon minus noon, divide that by 60. This gives us the percentage between the beginning of the time zone and the end of the time zone. Since there's 24 hours in a day, and 360 degrees of longitude (180 east and 180 west), time zones change every 15 degrees. Therefore, we take that percentage times 15 to get the number of degree east of the beginning of the time zone. This can be represented as `x+15n`, where `x` is how far east from the beginning of the time zone we are and n is the time zone.

That was a lot, so I'll give an example. Let's say Solar Noon is at 1230. 1230 minus 1200 is 30, and 30 divided by 60 is .5, so we are 50% between the beginning of the time zone and the end. Since the time zone is 15 degrees across, 50% of 15 is 7.5. So we know we are 7.5 degrees east of the beginning of the time zone. `x+15n` becomes `7.5+15n`. Our longitude could be any of the following: 7.5, 22.5, 37.5, 52.5, 67.5, 82.5, 97.5, 112.5, 127.5, 142.5, 157.5, 172.5, 187.5, 202.5, 217.5, 232.5, 247.5, 262.5, 277.5, 292.5, 307.5, 322.5, 337.5, and 352.5. Between this and the latitude, we can look at these locations on a map and determine whether or not they make sense, given the contents of the photo.

### Not Solar Noon

To develop the full equation to follow, we will isolate each component that is variable and then put them all together. First, we'll determine how to account for a change in time of day. We already know that Solar Noon is the maximum height the sun will be for the day. This *also* means that Solar Noon is the minimum Zenith Angle for the day. Logically, this makes Sunrise and Sunset the maximum Zenith Angle, which is 90 degrees. To start, we will assume the sun moves at a steady rate through the sky, so the calculation for the Zenith Angle based on time would be as follows: `Latitude+(90-Latitude)*(|Time of Day-noon|)/(noon-sunrise)`.

That's one hell of an equation (it will only get worse, trust me), so we'll break it down. We know that the Zenith Angle must at least be its minimum, which we know is it's Zenith Angle at Solar Noon, which we *also* know is it's Latitude. That's the first part. We then want to add degrees based on how far we made it into the day. `Time of Day-noon` gives us how far away from noon we are. Taking the absolute value (bounded by |) gives us just the amount of distance, not which direction; direction doesn't matter for this. Then, if we divide that by the difference between noon and sunrise (or how much time between maximum and minimum), it gives us the percentage of how far from noon to sunset/sunrise we are. That's the `(|Time of Day-noon|)/(noon/sunrise)` portion. Finally, that percentage is how far from Latitude to 90 we are, so if we take that percentage times 90-Latitude, that gives us how much to add to our Latitude, which is the `(Latitude-90)` portion.



### Not Equinox



### Putting It All Together


## Appendix A - Math Logic

```json
$solarzenithangle {
    degrees {
        acos {
            sin {
                radians {
                    $latitude
                }
            }
            *sin {
                radians {
                    $sundeclination
                }
            }
            +cos {
                radians {
                    $latitude
                }
            }
            *cos {
                radians {
                    $hourangle
                }
            }
        }
    }
}
```

```json
$latitude {given}
```

```json
$sundeclination {
    degrees {
        asin {
            sin {
                radians {
                    $obliqcorr
                }
            }
            *sin {
                radians {
                    $sunapplong
                }
            }
        }
    }
}
```

```json
$hourangle {
    if $truesolartime/4>0 {
        $truesolartime/4+180
    }
    else {
        $truesolartime/4-180
    }
}
```

```json
$obliqcorr {
    $meanobliqueecliptic {}
    +.00256*cos {
        radians {
            125.04 {}
            -1934.136*$julancentury {}
        }
    }
}
```

```json
$sunapplong {
    $suntruelong {}
    -.00569 {}
    -00478*sin {
        radians {
            125.04 {}
            -1934.136*$julancentury {}
        }
    }
}
```

```json
$truesolartime {
    mod {
        $minutespastmidnight*1400 {}
        +$eqoftime {}
        +4*$longitude {}
        +60*$timezone {}
        ,1440 {}
    }
}
```

```json
$meanobliqueecliptic {
    23+ {
        26+ {
            21.448 {}
            -$julancentury* {
                46.815 {}
                +$juliancentury* {
                    .00059 {}
                    -$julancentury*.001813
                }
            }
        }
        /60 {}
    }
    /60 {}
}
```

```json
$julancentury {
    {
        $julianday {}
        -2451545 {}
    }
    /36525 {}
}
```

```json
$suntruelong {
    $geommeanlongsun {}
    +$suneqofctr {}
}
```

```json
$minutespastmidnight {given}
```

```json
$eqoftime {
    4*degrees {
        $var-y*sin {
            2*radians {
                $geommeanlongsun {}
            }
        }
        -2*$eccentearthorbit*sin {
            radians {
                $geommeananomsun {}
            }
        }
        +4*$eccentearthorbit*$var-y*sin {
            radians {
                $geommeananomsun {}
            }
        }
        *cos {
            2*radians {
                $geommeanlongsun {}
            }
        }
        -.5*$var-y*$var-y*sin {
            4*radians {
                $geommeanlongsun
            }
        }
        -1.25*$eccentearthorbit*$eccentearthorbit*sin {
            2*radians {
                $geommeananomsun {}
            }
        }
    }
}
```

```json
$julianday {
    $date {}
    +2415018.5 {}
    $minutespastmidnight
}
```

```json
$geomeanlongsun {
    mod {
        280.46646 {}
        +$juliancentury* {
            36000.76983 {}
            +$juliancentury*.0003032 {}
        }
        ,360 {}
    }
}
```

```json
$suneqofctr {
    sin {
        radians {
            $geommeananomsun
        }
    }
    * {
        1.914602 {}
        -$juliancentury* {
            .004817 {}
            +.000014*$juliancentury {}
        }
    }
    +sin {
        radians {
            2*$geommeananomsun {}
        }
    }
    * {
        .019993 {}
        -.000101*$juliancentury {}
    }
    +sin {
        radians {
            3*$geommeananomsun {}
        }
    }
    *.000289
}
```

```json
$var-y {
    tan {
        radians {
            $obliqcorr/2 {}
        }
    }
    *tan {
        radians {
            $obliqcorr/2 {}
        }
    }
}
```

```json
$eccentearthorbit {
    .016708634 {}
    -$juliancentury* {
        .000042037 {}
        +.0000001267*$juliancentury
    }
}
```

```json
$geommeananomsun {
    mod {
        280.46646 {}
        +$juliancentury* {
            36000.76983 {}
            +$juliancentury*.0003032
        }
        ,360
    }
}
```