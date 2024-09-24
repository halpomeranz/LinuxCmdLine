## Free Linux Command Line Training

There are two courses here:

* "Zero to Linux" - An intro to the Linux command line. Hopefully this course is enough to get you started and equip you with the tools you need to learn on your own.

* "Linux Command Line for Analysts and Operators" - A longer course (usually taught over two days) that goes deeper into Linux command line techniques. It emphasizes practical examples for Red and Blue team folks.

In addition to the PDF files which are the courseware slides, I have also included setup for the lab exercises associated with the courses.

## Setting Up Your Lab Environment

1. Install Linux in a virtual machine. I recommend using a dedicated virtual machine for this because the lab setup script will plant "easter eggs" in different directories on the system. For example, it modifies the .bash_history files for users on the system and hides fake "malware" scripts for you to locate during the exercises. You can use either a local virtualization tool like VirtualBox or a cloud-based instance.

   * [Install Linux in VirtualBox](https://itsfoss.com/install-linux-in-virtualbox/)
   * [Install Linux in Amazon EC2](https://linux.how2shout.com/how-to-create-a-ubuntu-linux-aws-ec2-instance-on-amazon-cloud/)

2. Log into your virtual machine and install this repo. You may need to install the `git` package first. Installing the  `build-essential` package ensures you have all the tools necessary for the exercises.


```
sudo apt install git build-essential
git clone https://github.com/halpomeranz/LinuxCmdLine.git
```

3. Run the `setup/install` script AS A REGULAR USER. Do NOT run the script as the `root` user.

```
cd LinuxCmdLine
bash setup/install.sh
```

When you are done, you should have a directory named ~/Exercises with everything you need.
