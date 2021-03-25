ROOM: encryptioncrypto101

This fails because of a python update:

    $ ssh2john idrsa.id_rsa > hashed_idrsa.id_rsa.txt
    Traceback (most recent call last):
      File "/usr/bin/ssh2john", line 193, in <module>
        read_private_key(filename)
      File "/usr/bin/ssh2john", line 103, in read_private_key
        data = base64.decodestring(data)
    AttributeError: module 'base64' has no attribute 'decodestring'
    $ sed 's/decodestring/decodebytes/' /usr/bin/ssh2john | python3.9 - idrsa.id_rsa > ssh_hash.txt
