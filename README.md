## Warning

The sharing of this project on my GitHub aims to help peoples to open their minds to new logics or help peoples in case of difficulty. In no way, that aims to copy and paste this work on your own repository.

# inception

**inception** is a project from the **42** Common Core. This project aims to learn how to use Docker and Docker Compose. We have to create a Web Server by using NGINX, WORPRESS and MARIADB.

## Usage

Before cloning the repository, open and edit the `/etc/hosts` file by adding the line below.

```bash
127.0.0.1   mamaurai.42.fr
```

To avoid any CSS problem on your computer go to your web browser then left-click and select `Inspect` then `Network` and click on `Disable Cache`.

We can now install `Inception`.

```bash
$> gcl https://github.com/mathias-mrsn/inception.git
$> inception
# Optional to remove every docker containers, volumes or networks from yout PC
inception $> make dclean
[...]
inception $> make
[...] 
```

Now you just have to write `https://mamaurai.42.fr` on your web browser.