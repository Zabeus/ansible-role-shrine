# Port of i2b2's password hashing algorithm as a Jinja2 filter for use with Ansible
# original Java code (c) 2009 Raj Kuttan
# Python translation (c) 2016 Keith Dwyer 
from __future__ import (absolute_import, division, print_function)
__metaclass__ = type

from ansible import errors

import hashlib
import string
import struct

def i2b2_pass(a):
    md5 = hashlib.md5()
    md5.update(a)
    digest = md5.digest()

    byte_list = []

    # yes, the lack of zero-padding is necessary to mimic i2b2's implementation
    for b in digest:
      byte_list.append("%x" % struct.unpack('B', b))

    return string.join(byte_list, '')

class FilterModule(object):
    ''' i2b2 password hashing filter '''

    def filters(self):
        return {
            'i2b2_pass': i2b2_pass
        }