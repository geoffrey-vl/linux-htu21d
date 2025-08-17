# linux-htu21d

Small repo that allows using the HTU21D I2C sensor in linux userspace.

- src : contains the source code for the read_htu21d binary that reads the temperature and humidity values from the HTU21D
- dewpoint.sh : script that uses the read_htu21d binary and uses the values to calculate the dewpoint. Additionally reads the CPU temp.

# Wiring

![alt text](https://github.com/geoffrey-vl/linux-htu21d/blob/master/image.jpg?raw=true)

# Build

The read_htu21d is implemented by Oleg Kutkov, see Oleg Kutkov. Check the README in the src folder to build it, but you can also check out his work description here: https://olegkutkov.me/2018/02/21/htu21d-raspberry-pi/.

# Run

The dewpoint.sh script needs the read_htu21d binary to run. First build it using the above description, then move the generated binary one folder up to the level of the dewpoint.sh script. Next run the script:

```
$ dewpoint.sh
CPU Temperature: 49.93 °C
Housing Temperature: 31.13 °C
Housing Humidity: 44.26 %
Housing Dew Point: 17.51 °C
```
