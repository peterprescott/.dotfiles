# Further Setup

Some config files need to be copied into system directories.

`console-setup` defines the `FONTSIZE`, among other things.

```
mv console-setup /etc/default/console-setup
```

And the scripts in the `/etc/update-motd.d/` folder define 
the message which will greet you on login:

```
cp motd/* /etc/update-motd.d/
```

