# Adjust the set.sh

Adjust set.sh to:

* correct the path of the script
* use the correct usb device

# Auto clock set

Add this to your crontab (adjust for your path):

    @reboot /home/matt/work/asic-workshop/tinytapeout/clock_setter/set.sh

And at reboot the clock will be set.

# Manual clock set

Add this to your .bashrc:

    alias update_tt_time=~/work/asic-workshop/tinytapeout/clock_setter/set.sh

Then you can run `update_tt_time` to update the time.
