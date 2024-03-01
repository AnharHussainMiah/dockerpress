```console
       __           __
  ____/ /___  _____/ /_____  _________  ________  __________
 / __  / __ \/ ___/ //_/ _ \/ ___/ __ \/ ___/ _ \/ ___/ ___/
/ /_/ / /_/ / /__/ ,< /  __/ /  / /_/ / /  /  __(__  |__  )
\__,_/\____/\___/_/|_|\___/_/  / .___/_/   \___/____/____/
                              /_/
```

# DockerPress

![alt Experimental](https://img.shields.io/badge/Type-Image-red.svg)
![alt Kotlin](https://img.shields.io/badge/Language-Docker-blue.svg)
![alt API](https://img.shields.io/badge/Architecture-Container-green.svg)
![alt Failed](https://img.shields.io/badge/Failed-👎_0-red.svg)
![alt Passed](https://img.shields.io/badge/Passed-👍_0-green.svg)
![alt Version](https://img.shields.io/badge/version-0.5.0_BETA-blue.svg)

## What is this?

Running real world containerised `WordPress`instances can have a few "gotcha's". You can use `DockerPress` to get a production ready `WordPress` instance up and running really fast _(with working SMTP)_!

`WordPress` can be difficult to fully containerise as it's more of a "platform" then an actual immutable instance.

This poses some interesting challenges when trying to run `WordPress` in production. This repo takes the official image and then adds my custom tweaks that I found were required when running real world `WordPress` instances inside a container.

The `dockerpress` image can be used as a "runtime" and then all that is required for each specific instance is to volume mount the `wp-content` and also inject the various `ENV` such as the database credentials as well as unique salt values.

## How do I build the DockerPress Image?

To build from source, use the following steps:

```console
$ git clone https://github.com/AnharHussainMiah/dockerpress
# change into the newly cloned repo
$ cd dockerpress/
# finally run the build script
$ ./build.sh
```

## Running image locally

You can run this image locally just use the script `./run.sh`, this will help you test out the custom image locally first _(it also build and spin up a MySql instance for you)_.

# Environment Variables

| Env Key          | Description      | Example    |
| ---------------- | ---------------- | ---------- |
| DB_NAME          | Database name    | wordpress  |
| DB_USER          | Database user    | admin      |
| DB_PASS          | Database passord | 3m$2dasd.! |
| DB_HOST          | Database host    | localhost  |
| AUTH_KEY         | WP salt keys     | xxxx       |
| SECURE_AUTH_KEY  | WP salt keys     | xxxx       |
| LOGGED_IN_KEY    | WP salt keys     | xxxx       |
| NONCE_KEY        | WP salt keys     | xxxx       |
| AUTH_SALT        | WP salt keys     | xxxx       |
| SECURE_AUTH_SALT | WP salt keys     | xxxx       |
| LOGGED_IN_SALT   | WP salt keys     | xxxx       |
| NONCE_SALT       | WP salt keys     | xxxx       |

# Volume Mount

Aside from the MySql database the only other thing that you need to keep persistent is the `wp-content` folder. You can mount this as follows:

```console
-v "$(pwd)/wp-content":/var/www/html/wp-content/
```

the above assumes you have a folder called `wp-content` this will me mapped internally to the WordPress instance. You will need to make provisions to backup your host's `wp-content`.

# Version

0.1.0-BETA

## Contributing

1. Fork it (<https://github.com/AnharHussainMiah/dockerpress/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [anharmiah](https://github.com/anharhussainmiah) Anhar Miah - creator, maintainer
