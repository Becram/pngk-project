# Raspbian Customization
#### Author : Bikram Dhoju [bikramdhoju.com.np]

### 1. Configure keyboard to US and locale to english as:
Edit /etc/default/locale and set the contents to:
```
LANG="en_US.UTF-8"
```
You can check which locales you currently have generated using:
```
# locale -a
```
You can generate more by editing /etc/locale.gen and uncommenting the lines for the locales that you want to enable. Then you can generate them by running:
```
# locale-gen
```

### 2. Configure RTC module
RTC modules are used foor keeping the time in Raspberry Pi. Unlike modern motherboards raspberry pi do not have inbuilt timer module so we need a additional hardware to configure this.
![](https://i.ebayimg.com/images/g/fAoAAMXQyY1TTW1q/s-l300.jpg)

Please follow link [here](https://thepihut.com/blogs/raspberry-pi-tutorials/17209332-adding-a-real-time-clock-to-your-raspberry-pi)

### 3. Provisoning the Raspberry Pi
First clone the project: https://github.com/Becram/pngk-project/
We will be using this script to automatically install all packages namely Khan Academy, Epaath, PheT Simulation, Wikipedia and many other configuration.
USAGE:
```
# sudo ./provision
```
Repo Description.
The ``provision`` script will call the multiple scripts localted inside the scripts.d directory functions of which is explained below.
i. ``00_update_pkg:`` This will upgrade the Raspberry Pi

ii. ``01_install_pkg:`` Install important packages as libreoffice,stellerium and many   other packages

iii. ``02_create_launcher:`` This script will create the launchers for the application we will be installing. It will create launcher's in Education category in main menu for EPaath, Khan Academy, PheT, Wikipedia.
In order to create launcher populate the <dataset.js> file with relevent data to create the launcher automatically.

iv. ``03_enable_ssh:`` SSH is diabled by default in Raspbian this will enable it.

v. ``04_vim_configure:`` Configure vim

vi. ``05_disable_swap:`` Swap uses sd card as RAM which reduces SD card life so it needs to de disabled

vii. ``06_install_kiwix_server:`` Installs kiwix server which serves zim file as wikipedia. This script also creates the supervisor service for kiwix. Kiwix service can be configured by going to localhost:9001 with username:pngk and password:pngk.
Kiwix server serves zim files from the directory /kiwix-data.

You may also add zim files in /kiwix-data and run ``sudo add-zim`` to add other zim files.

viii. ``07_kolibri:`` Script to install kolibri and create systemd service. Kolibri is used to to serve the Khan Academy (20 GB) and Phet Simulation(~500 MB) Activity.

ix. ``08_restore_pixel:`` Some times students mistakenly might delete menubar which is ver hard to restore for non techies, so this script will add a script to restore the panel. Just run ``sudo restore`` in terminal to retore the panel.

x. ``09_supervisor:`` Configure supervisor to access the kiwix server service.

xi. ``10_disable_bluetooth`` Since we wont be needing the bluetooth we disable it.

### NB. Though provision script runs all scripts you may also run individual one by one,
