Crossbar Configuration
~~~~~~~~~~~~~~~~~~~~~~

System Configs
^^^^^^^^^^^^^^

The following table outlines the configs that can be found in the
``system_config`` database, ``crossbar`` document:

+--------+---------+------------+----------------+
| Key    | Type    | Default    | Description    |
+========+=========+============+================+
| ``api_ | ``integ | 35         | Default token  |
| auth_t | er()``  |            | cost of        |
| okens` |         |            | creating an    |
| `      |         |            | auth token via |
|        |         |            | API key        |
+--------+---------+------------+----------------+
| ``auto | ``list( | See        | The list of    |
| load_m | string( | `here <htt | Crossbar       |
| odules | ))``    | ps://githu | modules        |
| ``     |         | b.com/2600 | initially      |
|        |         | hz/kazoo/b | started        |
|        |         | lob/master |                |
|        |         | /applicati |                |
|        |         | ons/crossb |                |
|        |         | ar/src/cro |                |
|        |         | ssbar.hrl# |                |
|        |         | L65-L119>` |                |
|        |         | __         |                |
+--------+---------+------------+----------------+
| ``cach | ``integ | 300        | Cache TTL, in  |
| e_ttl` | er()``  |            | seconds        |
| `      |         |            |                |
+--------+---------+------------+----------------+
| ``clea | ``integ | 86400      | Time, in       |
| nup_ti | er()``  |            | seconds, to    |
| mer``  |         |            | run the        |
|        |         |            | cleanup        |
|        |         |            | routines       |
+--------+---------+------------+----------------+
| ``comp | ``boole | ``true``   | Whether to     |
| ress_r | an()``  |            | compress the   |
| espons |         |            | response body  |
| e_body |         |            | before sending |
| ``     |         |            |                |
+--------+---------+------------+----------------+
| ``defa | ``boole | ``true``   | Whether to     |
| ult_al | an()``  |            | allow          |
| low_an |         |            | unauthenticate |
| onymou |         |            | d              |
| s_quic |         |            | quickcall API  |
| kcalls |         |            | requests       |
| ``     |         |            |                |
+--------+---------+------------+----------------+
| ``defa | ``strin | ``en-US``  | The default    |
| ult_la | g()``   |            | language, if   |
| nguage |         |            | none are       |
| ``     |         |            | defined on the |
|        |         |            | account        |
+--------+---------+------------+----------------+
| ``magi | ``list( | See        | Magic path     |
| c_path | string( | `here <htt | templates      |
| _patte | ))``    | ps://githu |                |
| rns``  |         | b.com/2600 |                |
|        |         | hz/kazoo/b |                |
|        |         | lob/master |                |
|        |         | /applicati |                |
|        |         | ons/crossb |                |
|        |         | ar/src/cro |                |
|        |         | ssbar_defa |                |
|        |         | ult_handle |                |
|        |         | r.erl#L21- |                |
|        |         | L24>`__    |                |
+--------+---------+------------+----------------+
| ``max_ | ``integ | 8000000    | Max upload     |
| upload | er()``  | bytes      | size for       |
| _size` |         | (8Mb)      | request bodies |
| `      |         |            |                |
+--------+---------+------------+----------------+
| ``maxi | ``integ | 2682000    | Maximum range, |
| mum_ra | er()``  |            | in seconds,    |
| nge``  |         |            | for time-based |
|        |         |            | view queries   |
+--------+---------+------------+----------------+
| ``pagi | ``integ | 50         | Default page   |
| nation | er()``  |            | size when      |
| _page_ |         |            | paginating     |
| size`` |         |            |                |
+--------+---------+------------+----------------+
| ``port | ``integ | 8000       | Port to listen |
| ``     | er()``  |            | for            |
|        |         |            | unencrypted    |
|        |         |            | traffic        |
+--------+---------+------------+----------------+
| ``pret | ``boole | ``true``   | Pretty-print   |
| ty_met | an()``  |            | metrics in     |
| rics`` |         |            | logs           |
+--------+---------+------------+----------------+
| ``requ | ``integ | 10000      | Time, in       |
| est_ti | er()``  |            | milliseconds,  |
| meout_ |         |            | for requests   |
| ms``   |         |            | to timeout     |
+--------+---------+------------+----------------+
| ``rese | ``integ | 250        | Password-reset |
| t_id_s | er()``  |            | ID length      |
| ize``  |         |            |                |
+--------+---------+------------+----------------+
| ``sche | ``boole | ``false``  | Toggles        |
| ma_str | an()``  |            | whether to     |
| ict_va |         |            | perform type   |
| lidati |         |            | converions on  |
| on``   |         |            | client data    |
|        |         |            | when           |
|        |         |            | validating     |
+--------+---------+------------+----------------+
| ``soft | ``integ | 10000      | Time, in       |
| _delet | er()``  |            | milliseconds,  |
| e_paus |         |            | to pause       |
| e_ms`` |         |            | between        |
|        |         |            | deletions      |
+--------+---------+------------+----------------+
| ``ssl_ | ``strin | ``undefine | Path to CA     |
| ca_cer | g()``   | d``        | cert file      |
| t``    |         |            |                |
+--------+---------+------------+----------------+
| ``ssl_ | ``strin | ``/path/to | Path to cert   |
| cert`` | g()``   | /crossbar/ | file           |
|        |         | priv/ssl/c |                |
|        |         | rossbar.cr |                |
|        |         | t``        |                |
+--------+---------+------------+----------------+
| ``ssl_ | ``strin | ``/path/to | Path to key    |
| key``  | g()``   | /crossbar/ | file           |
|        |         | priv/ssl/c |                |
|        |         | rossbar.ke |                |
|        |         | y``        |                |
+--------+---------+------------+----------------+
| ``ssl_ | ``strin | ``""``     | Cert password  |
| passwo | g()``   |            |                |
| rd``   |         |            |                |
+--------+---------+------------+----------------+
| ``ssl_ | ``integ | 8443       | Port to listen |
| port`` | er()``  |            | for SSL        |
|        |         |            | traffic        |
+--------+---------+------------+----------------+
| ``ssl_ | ``integ | 100        | Number of SSL  |
| worker | er()``  |            | listeners to   |
| s``    |         |            | start          |
+--------+---------+------------+----------------+
| ``toke | ``integ | 1          | Default token  |
| n_cost | er()``  |            | cost of an API |
| s``    |         |            | request        |
+--------+---------+------------+----------------+
| ``trac | ``strin | ``/tmp``   | Path to put    |
| e_path | g()``   |            | trace files    |
| ``     |         |            | when profiling |
|        |         |            | API requests   |
+--------+---------+------------+----------------+
| ``use_ | ``boole | ``true``   | Whether to     |
| plaint | an()``  |            | start          |
| ext``  |         |            | unecrypted     |
|        |         |            | listener (port |
|        |         |            | 8000 traffic,  |
|        |         |            | typically)     |
+--------+---------+------------+----------------+
| ``use_ | ``boole | ``false``  | Whether to     |
| ssl``  | an()``  |            | start an SSL   |
|        |         |            | listener       |
+--------+---------+------------+----------------+
| ``user | ``integ | 35         | Default token  |
| _auth_ | er()``  |            | cost of        |
| tokens |         |            | creating an    |
| ``     |         |            | auth token via |
|        |         |            | username       |
+--------+---------+------------+----------------+
| ``work | ``integ | 100        | Number of TCP  |
| ers``  | er()``  |            | listeners to   |
|        |         |            | start          |
+--------+---------+------------+----------------+

Additional Configs
^^^^^^^^^^^^^^^^^^

Some modules use the ``crossbar`` namespace to create a specific
``system_config`` document for settings as well.

``crossbar.accounts``
'''''''''''''''''''''

``crossbar.auth``
'''''''''''''''''

``crossbar.braintree``
''''''''''''''''''''''

``crossbar.callflows``
''''''''''''''''''''''

``crossbar.cdrs``
'''''''''''''''''

``crossbar.devices``
''''''''''''''''''''

``crossbar.fax``
''''''''''''''''

``crossbar.freeswitch``
'''''''''''''''''''''''

``crossbar.local_resources``
''''''''''''''''''''''''''''

``crossbar.media``
''''''''''''''''''

``crossbar.notifications``
''''''''''''''''''''''''''

``crossbar.onboard``
''''''''''''''''''''

``crossbar.port_requests``
''''''''''''''''''''''''''

``crossbar.presence``
'''''''''''''''''''''

``crossbar.provisioner_templates``
''''''''''''''''''''''''''''''''''

``crossbar.queues``
'''''''''''''''''''

``crossbar.resource_selectors``
'''''''''''''''''''''''''''''''

``crossbar.resource_templates``
'''''''''''''''''''''''''''''''

``crossbar.resources``
''''''''''''''''''''''

``crossbar.services``
'''''''''''''''''''''

``crossbar.sms``
''''''''''''''''

``crossbar.token_restrictions``
'''''''''''''''''''''''''''''''
