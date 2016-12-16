Media
~~~~~

About Media
^^^^^^^^^^^

Uploading media for custom music on hold, IVR prompts, or TTS (if a proper TTS engine is enabled).

Kazoo provides some default system media files for common things like voicemail prompts. These are accessible via the media Crossbar endpoint as well, if your user has superduper admin privileges. To manipulate those resources, simply omit the ``/accounts/{ACCOUNT_ID}`` from the URI.

For example, to get a listing of all system media files:

::

    curl -v -X GET -H "X-Auth-Token: {AUTH_TOKEN}" http://server.com:8000/v2/media

You can then get the "id" of the media file and manipulate it in a similar fashion as regular account media (including TTS if you have a TTS engine like iSpeech configured).

Part of the schema of media files is a language attribute. It defaults to a ``system_config/media`` value for the ``default_language`` key (and is "en-us" by default). Properly defined media files can be searched for based on language using the basic filters provided by Crossbar:

::

    curl -v -X GET -H "X-Auth-Token: {AUTH_TOKEN}" http://server.com:8000/v2/media?filter_language=en
    curl -v -X GET -H "X-Auth-Token: {AUTH_TOKEN}" http://server.com:8000/v2/media?filter_language=en-US
    curl -v -X GET -H "X-Auth-Token: {AUTH_TOKEN}" http://server.com:8000/v2/media?filter_language=fr-FR

The comparison is case-insensitive, but ``en`` and ``en-US`` are treated separately. If a media metadata object is missing a language attribute (on an older installation when system media was imported with no language field, say), use ``key_missing=language`` in the request.

Once you've assigned languages, you can use the ```language`` callflow action <../../callflow/doc/language.md>`__ to set the language for that call.

Kazoo can be configured to normalize uploaded media files. This can fix things like:

-  Normalizing volume
-  Fix clipping
-  Standardize formats

By default, if enabled, normalization will convert all media to MP3 (retaining the original upload as well) using the `*sox* utility <http://sox.sourceforge.net/>`__ to accomplish the conversion.

Enable Normalization Via SUP:

Enable normalization for this particular server: ``sup kapps_config set crossbar.media normalize_media true``

Enable normalization for all servers: ``sup kapps_config set_default crossbar.media normalize_media true``

Enable Normalization Via DB:

1. Open ``system_config/crossbar.media`` document, create or update the key ``normalize_media`` to ``true``.
2. Flush the kapps\_config cache, ``sup kapps_config flush crossbar.media``, on all servers running Crossbar.

Set Target Format Via SUP:

For the server: ``sup kapps_config set crossbar.media normalization_format ogg``

For all servers: ``sup kapps_config set_default crossbar.media normalization_format ogg``

Set Target Format Via DB:

In the ``system_config/crossbar.media`` document, create or update the key ``normalization_format`` to your desired format (``mp3``, ``wav``, etc). Flush the kapps\_config cache on all servers running Crossbar. All new uploads will be normalized (if possible) to the new format.

Normalization parameters:

The default *sox* command is ``sox -t <input_format> - -r 8000 -t <output_format> -`` but this is configurable via the ``system_config/media`` document (or similar SUP command).

You can fine-tune the source and destination arguments using the ``normalize_source_args`` and ``normalize_destination_args`` keys respectively. By default, the source args are "" and the destination args are "-r 8000" (as can be seen from the default sox command above.

The normalizer code uses stdin to send the binary data to sox and reads from stdout to get the normalized binary data back (the " - " (there are 2) in command above).

You can also set the specific path for ``sox`` in the ``normalize_executable`` key, in case you've installed it to a non-standard path.

Be sure to install sox with mp3 support! Conversion will not happen (assuming you're targeting mp3) if sox can't write the mp3. You can check the media meta document for the key ``normalization_error`` if sox failed for some reason.

Schema
^^^^^^

+------+--------------+-------+----------+-----------+
| Key  | Description  | Type  | Default  | Required  |
+======+==============+=======+==========+===========+
| ``co | Length, in   | ``int |          | ``false`` |
| nten | bytes, of    | eger` |          |           |
| t_le | the file     | `     |          |           |
| ngth |              |       |          |           |
| ``   |              |       |          |           |
+------+--------------+-------+----------+-----------+
| ``co | Used to      | ``str |          | ``false`` |
| nten | override the | ing(' |          |           |
| t_ty | automatic    | audio |          |           |
| pe`` | upload type  | /mp3' |          |           |
|      |              | , 'au |          |           |
|      |              | dio/m |          |           |
|      |              | peg', |          |           |
|      |              |  'aud |          |           |
|      |              | io/mp |          |           |
|      |              | eg3', |          |           |
|      |              |  'aud |          |           |
|      |              | io/x- |          |           |
|      |              | wav', |          |           |
|      |              |  'aud |          |           |
|      |              | io/wa |          |           |
|      |              | v', ' |          |           |
|      |              | audio |          |           |
|      |              | /ogg' |          |           |
|      |              | , 'vi |          |           |
|      |              | deo/x |          |           |
|      |              | -flv' |          |           |
|      |              | , 'vi |          |           |
|      |              | deo/h |          |           |
|      |              | 264', |          |           |
|      |              |  'vid |          |           |
|      |              | eo/mp |          |           |
|      |              | eg',  |          |           |
|      |              | 'vide |          |           |
|      |              | o/qui |          |           |
|      |              | cktim |          |           |
|      |              | e', ' |          |           |
|      |              | video |          |           |
|      |              | /mp4' |          |           |
|      |              | , 'vi |          |           |
|      |              | deo/w |          |           |
|      |              | ebm') |          |           |
|      |              | ``    |          |           |
+------+--------------+-------+----------+-----------+
| ``de | A breif      | ``str |          | ``false`` |
| scri | description  | ing(1 |          |           |
| ptio | of the media | ..128 |          |           |
| n``  | update,      | )``   |          |           |
|      | usally the   |       |          |           |
|      | original     |       |          |           |
|      | file name    |       |          |           |
+------+--------------+-------+----------+-----------+
| ``la | The language | ``str | ``en-us` | ``false`` |
| ngua | of the media | ing`` | `        |           |
| ge`` | file or text |       |          |           |
+------+--------------+-------+----------+-----------+
| ``me | Defines the  | ``str | ``upload | ``false`` |
| dia_ | source of    | ing(' | ``       |           |
| sour | the media    | recor |          |           |
| ce`` |              | ding' |          |           |
|      |              | , 'up |          |           |
|      |              | load' |          |           |
|      |              | , 'tt |          |           |
|      |              | s')`` |          |           |
+------+--------------+-------+----------+-----------+
| ``na | A friendly   | ``str |          | ``true``  |
| me`` | name for the | ing(1 |          |           |
|      | media        | ..128 |          |           |
|      |              | )``   |          |           |
+------+--------------+-------+----------+-----------+
| ``pr | The prompt   | ``str |          | ``false`` |
| ompt | this media   | ing`` |          |           |
| _id` | file         |       |          |           |
| `    | represents   |       |          |           |
+------+--------------+-------+----------+-----------+
| ``so | If the media | ``str |          | ``false`` |
| urce | was          | ing(3 |          |           |
| _id` | generated    | 2)``  |          |           |
| `    | from a       |       |          |           |
|      | callflow     |       |          |           |
|      | module, this |       |          |           |
|      | is ID of the |       |          |           |
|      | properties   |       |          |           |
+------+--------------+-------+----------+-----------+
| ``so | If the media | ``str |          | ``false`` |
| urce | was          | ing`` |          |           |
| _typ | generated    |       |          |           |
| e``  | from a       |       |          |           |
|      | callflow     |       |          |           |
|      | module, this |       |          |           |
|      | is the       |       |          |           |
|      | module name  |       |          |           |
+------+--------------+-------+----------+-----------+
| ``st | Determines   | ``boo | ``true`` | ``false`` |
| ream | if the media | lean` |          |           |
| able | can be       | `     |          |           |
| ``   | streamed     |       |          |           |
+------+--------------+-------+----------+-----------+
| ``tt | Text-to-spee | ``obj | ``{}``   | ``false`` |
| s``  | ch           | ect`` |          |           |
|      | options used |       |          |           |
|      | to create    |       |          |           |
|      | audio files  |       |          |           |
|      | from text    |       |          |           |
+------+--------------+-------+----------+-----------+
| ``tt | The text to  | ``str |          | ``false`` |
| s.te | be converted | ing(1 |          |           |
| xt`` | into audio   | ..)`` |          |           |
+------+--------------+-------+----------+-----------+
| ``tt | The voice to | ``str | ``female | ``false`` |
| s.vo | be used      | ing(' | /en-US`` |           |
| ice` | during the   | femal |          |           |
| `    | conversion   | e/en- |          |           |
|      |              | US',  |          |           |
|      |              | 'male |          |           |
|      |              | /en-U |          |           |
|      |              | S', ' |          |           |
|      |              | femal |          |           |
|      |              | e/en- |          |           |
|      |              | CA',  |          |           |
|      |              | 'fema |          |           |
|      |              | le/en |          |           |
|      |              | -AU', |          |           |
|      |              |  'fem |          |           |
|      |              | ale/e |          |           |
|      |              | n-GB' |          |           |
|      |              | , 'ma |          |           |
|      |              | le/en |          |           |
|      |              | -GB', |          |           |
|      |              |  'fem |          |           |
|      |              | ale/e |          |           |
|      |              | s-US' |          |           |
|      |              | , 'ma |          |           |
|      |              | le/es |          |           |
|      |              | -US', |          |           |
|      |              |  'fem |          |           |
|      |              | ale/u |          |           |
|      |              | s-US' |          |           |
|      |              | , 'fe |          |           |
|      |              | male/ |          |           |
|      |              | zh-CN |          |           |
|      |              | ', 'm |          |           |
|      |              | ale/z |          |           |
|      |              | h-CN' |          |           |
|      |              | , 'fe |          |           |
|      |              | male/ |          |           |
|      |              | zh-HK |          |           |
|      |              | ', 'f |          |           |
|      |              | emale |          |           |
|      |              | /zh-T |          |           |
|      |              | W', ' |          |           |
|      |              | femal |          |           |
|      |              | e/ja- |          |           |
|      |              | JP',  |          |           |
|      |              | 'male |          |           |
|      |              | /ja-J |          |           |
|      |              | P', ' |          |           |
|      |              | femal |          |           |
|      |              | e/ko- |          |           |
|      |              | KR',  |          |           |
|      |              | 'male |          |           |
|      |              | /ko-K |          |           |
|      |              | R', ' |          |           |
|      |              | femal |          |           |
|      |              | e/da- |          |           |
|      |              | DK',  |          |           |
|      |              | 'fema |          |           |
|      |              | le/de |          |           |
|      |              | -DE', |          |           |
|      |              |  'mal |          |           |
|      |              | e/de- |          |           |
|      |              | DE',  |          |           |
|      |              | 'fema |          |           |
|      |              | le/ca |          |           |
|      |              | -ES', |          |           |
|      |              |  'fem |          |           |
|      |              | ale/e |          |           |
|      |              | s-ES' |          |           |
|      |              | , 'ma |          |           |
|      |              | le/es |          |           |
|      |              | -ES', |          |           |
|      |              |  'fem |          |           |
|      |              | ale/f |          |           |
|      |              | i-FI' |          |           |
|      |              | , 'fe |          |           |
|      |              | male/ |          |           |
|      |              | fr-CA |          |           |
|      |              | ', 'm |          |           |
|      |              | ale/f |          |           |
|      |              | r-CA' |          |           |
|      |              | , 'fe |          |           |
|      |              | male/ |          |           |
|      |              | fr-FR |          |           |
|      |              | ', 'm |          |           |
|      |              | ale/f |          |           |
|      |              | r-FR' |          |           |
|      |              | , 'fe |          |           |
|      |              | male/ |          |           |
|      |              | it-IT |          |           |
|      |              | ', 'm |          |           |
|      |              | ale/i |          |           |
|      |              | t-IT' |          |           |
|      |              | , 'fe |          |           |
|      |              | male/ |          |           |
|      |              | nb-NO |          |           |
|      |              | ', 'f |          |           |
|      |              | emale |          |           |
|      |              | /nl-N |          |           |
|      |              | L', ' |          |           |
|      |              | femal |          |           |
|      |              | e/pl- |          |           |
|      |              | PL',  |          |           |
|      |              | 'fema |          |           |
|      |              | le/pt |          |           |
|      |              | -BR', |          |           |
|      |              |  'fem |          |           |
|      |              | ale/p |          |           |
|      |              | t-PT' |          |           |
|      |              | , 'ma |          |           |
|      |              | le/pt |          |           |
|      |              | -PT', |          |           |
|      |              |  'fem |          |           |
|      |              | ale/r |          |           |
|      |              | u-RU' |          |           |
|      |              | , 'ma |          |           |
|      |              | le/ru |          |           |
|      |              | -RU', |          |           |
|      |              |  'fem |          |           |
|      |              | ale/s |          |           |
|      |              | v-SE' |          |           |
|      |              | , 'fe |          |           |
|      |              | male/ |          |           |
|      |              | hu-HU |          |           |
|      |              | ', 'f |          |           |
|      |              | emale |          |           |
|      |              | /cs-C |          |           |
|      |              | Z', ' |          |           |
|      |              | femal |          |           |
|      |              | e/tr- |          |           |
|      |              | TR',  |          |           |
|      |              | 'male |          |           |
|      |              | /tr-T |          |           |
|      |              | R', ' |          |           |
|      |              | male/ |          |           |
|      |              | ru-RU |          |           |
|      |              | /Vlad |          |           |
|      |              | imir' |          |           |
|      |              | , 'fe |          |           |
|      |              | male/ |          |           |
|      |              | ru-RU |          |           |
|      |              | /Juli |          |           |
|      |              | a', ' |          |           |
|      |              | femal |          |           |
|      |              | e/ru- |          |           |
|      |              | RU/An |          |           |
|      |              | na',  |          |           |
|      |              | 'fema |          |           |
|      |              | le/ru |          |           |
|      |              | -RU/V |          |           |
|      |              | iktor |          |           |
|      |              | ia',  |          |           |
|      |              | 'male |          |           |
|      |              | /ru-R |          |           |
|      |              | U/Ale |          |           |
|      |              | xande |          |           |
|      |              | r', ' |          |           |
|      |              | femal |          |           |
|      |              | e/ru- |          |           |
|      |              | RU/Ma |          |           |
|      |              | ria', |          |           |
|      |              |  'fem |          |           |
|      |              | ale/r |          |           |
|      |              | u-RU/ |          |           |
|      |              | Lidia |          |           |
|      |              | ')``  |          |           |
+------+--------------+-------+----------+-----------+

Get a listing of media files
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/media

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/media

Create a nee media object (required before uploading the actual media data)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    PUT /v2/accounts/{ACCOUNT\_ID}/media

-  For a file:

.. code:: shell

    curl -v -X PUT \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -d '{"data":{
            "streamable":true,
            "name": "File",
            "description": "My Test Media File",
            }}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/media

-  For a prompt:

.. code:: shell

    curl -v -X PUT \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -d '{"data":{
            "streamable": true,
            "name": "FR-vm-enter_pass",
            "description": "FR - Enter Password prompt",
            "prompt_id": "vm-enter_pass",
            "language":"fr"
            }}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/media

-  For a TTS document: (requires iSpeech to be enabled)

.. code:: shell

    curl -v -X PUT \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -d '{"data":{
            "name": "TestTTS",
            "media_source": "tts",
            "tts": {"text": "Testing TTS", "voice": "female/en-US"}
            }}' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/media

A response:

.. code:: json

    {
        "data":
        {
            "streamable": true,
            "name": "vm-enter_pass",
            "description": "FR - Enter Password prompt",
            "prompt_id": "vm-enter_pass",
            "language": "fr-fr",
            "tts": {
                "voice": "female/en-US"
            },
            "media_source": "upload",
            "id": "fr-fr%2Fvm-enter_pass"
        },
        "revision": "{REVISION}",
        "request_id": "{REQUEST_ID}",
        "status": "success",
        "auth_token": "{AUTH_TOKEN}"
    }

Remove metadata
^^^^^^^^^^^^^^^

    DELETE /v2/accounts/{ACCOUNT\_ID}/media/{MEDIA\_ID}

.. code:: shell

    curl -v -X DELETE \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/media/{MEDIA_ID}

Get metadata about a media file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/media/{MEDIA\_ID}

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/media/{MEDIA_ID}

Update metadata
^^^^^^^^^^^^^^^

    POST /v2/accounts/{ACCOUNT\_ID}/media/{MEDIA\_ID}

.. code:: shell

    curl -v -X POST \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/media/{MEDIA_ID}

List all prompts and the number of translations existing
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/media/prompts

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/media/prompts

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": [
            {
                "agent-already_logged_in": 1,
                "agent-enter_pin": 1,
                "agent-invalid_choice": 1,
                "agent-logged_in": 1,
                "agent-logged_out": 1,
                "agent-not_call_center_agent": 1,
                "agent-pause": 1,
                "agent-resume": 1,
                "agent_enter_pin": 1,
                "agent_logged_already_in": 1,
                "agent_logged_in": 1,
                "agent_logged_out": 1,
                "cf-disabled": 1,
                "cf-disabled_menu": 1,
                "cf-enabled_menu": 1,
                "cf-enter_number": 1,
                "cf-move-no_channel": 1,
                "cf-move-no_owner": 1,
                "cf-move-too_many_channels": 1,
                "cf-not_available": 1,
                "cf-now_forwarded_to": 1,
                "cf-unauthorized_call": 1,
                "conf-alone": 1,
                "conf-bad_conf": 1,
                "conf-bad_pin": 1
            }
        ],
        "next_start_key": "conf-deaf",
        "page_size": 25,
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "status": "success"
    }

List languages available
^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/media/languages

This request will return a list of languages found, as well as the counts of how many media files have that language defined:

Note, the "missing" key indicates how many media files have no associated language.

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/media/languages

.. code:: json

    {
        "data": [{ "en": 3
                   ,"missing": 1
                 }
                ],
    }

Get the raw media file
^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/media/{MEDIA\_ID}/raw

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -H 'Accept: audio/mp3' \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/media/{MEDIA_ID}/raw

Streams back an MP3-encoded media.

Add the media binary file to the media meta data
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    POST /v2/accounts/{ACCOUNT\_ID}/media/{MEDIA\_ID}/raw

.. code:: shell

    curl -v -X POST \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -H 'Content-Type: audio/mp3' \
        --data-binary @/path/to/file.mp3 \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/media/{MEDIA_ID}/raw

.. code:: shell

    curl -v -X POST \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        -H 'Content-Type: audio/x-wav \
        --data-binary @/path/to/file.wav \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/media/{MEDIA_ID}/raw

Only one of the above; any subsequent POSTs will overwrite the existing binary data.

List all translations of a given prompt
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/media/prompts/{PROMPT\_ID}

You can use that list to fetch the specific media files associated with that prompt.

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/media/prompts/{PROMPT_ID}

.. code:: json

    {
        "auth_token": "{AUTH_TOKEN}",
        "data": [
            "fr-fr%2Fvm-enter_pass",
            "en-us%2Fvm-enter_pass"
        ],
        "page_size": 2,
        "request_id": "{REQUEST_ID}",
        "revision": "{REVISION}",
        "start_key": "vm-enter_pass",
        "status": "success"
    }

List media files with specific language
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

    GET /v2/accounts/{ACCOUNT\_ID}/media/languages/{LANGUAGE}

.. code:: shell

    curl -v -X GET \
        -H "X-Auth-Token: {AUTH_TOKEN}" \
        http://{SERVER}:8000/v2/accounts/{ACCOUNT_ID}/media/languages/{LANGUAGE}

.. code:: json

    {
        "data":["media_id_1", "media_id_2",...]
    }

To get the IDs of the media docs missing a language:
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

::

    curl -v -X GET -H "X-Auth-Token: {AUTH_TOKEN}" http://server.com:8000/v2/accounts/{ACCOUNT_ID}/media/languages/missing
    ...
    "data":["media_id_1", "media_id_2",...]
    ...
