CONFIG

The global variable "config" holds all the global state. It's elements are
documented below.

config.
    rotation_axis           Axes around which the circle is drawn
    points_todo             Points on the circle that we should iterate over
    earth_field             Measured earth field
    psu_output_state        Current state of the power supplies output (aka "OUTPUT ON/OFF"). 0 or 1.
    instruments.            Handles to instruments
        psux                Serial handles to the power supply
        psuy                (see above)
        psuz	            (see above)
    guihandles.             Handles to GUI elements
        axes_3d             3D visualization plot
        text_earthfield     Earth field numeric display

LOG

The local variable "log" holds the log of a rotation cycle. It's elements are
documented below. Every element should have the same number of lines.

t is the time since start of experiment
x,y,z are axes

log.
    field_exp               Value the magnetic field should have, s, Tesla, [t x y z]
    field_mea               Value it actually has (measured), s, Tesla
    current_set             Value the current output should have, s, Ampere
    current_act             Value it actually has (measured), s, Ampere
                            Note that the sign (polarity) cannot be measured
                            - the polarity switch relays are assumed to be
                            in the correct position.
    field_set_antiparallel  ?
    earth_field             Measured field at start of experiment?
    swtime                  Time taken to set the field to the computed value (seconds)
    date                    Date (after setting the field values. Time before
                            is to_seconds(date) - swtime [y m d h m s]
    date_start              Time at experiment start


