# Hyku
[Hyku beta.x](https://github.com/samvera-labs/hyku) vagrant box.

## Requirements

* [Vagrant](https://www.vagrantup.com/)
* [VirtualBox](https://www.virtualbox.org/)

## Usage

1. `git clone https://github.com/seanlw/hyku-vagrant.git`
2. `cd hyku-vagrant`
3. `vagrant up`
4. Visit [http://localhost:8080](http://localhost:8080)

## Create super admin user

1. Visit [http://localhost:8080/users/sign_up](http://localhost:8080/users/sign_up) in your browser
2. Create a new account
3. Open a new terminal
4. `cd hyku-vagrant`
5. `vagrant ssh`
6. `cd /var/www/hyku`
7. `bundle exec rake superadmin:grant[user@email.org]` where `user@email.org` is the email you registered

## Multi tenant domains

You will need to create a new domain in your hosts file before creating a new repository.

1. Modify `/etc/hosts` on your host machine
2. Add `127.0.0.1 example.localhost` where `example` will be the short name to the repository
3. Visit [http://localhost:8080](http://localhost:8080) and log in as super admin
3. Enter `example` for the "Short name"

## Stoping vagrant

To stop vagrant run `vagrant halt`. To remove hyku vagrant and the virtual machine run `vagrant destroy`.

## Environment

* Ubuntu 16.04 64-bit machine with:
  * [Apache](https://httpd.apache.org/)
  * [Fedora 4.x](http://fedora.info/about) at [http://localhost:8984/fedora4/rest](http://localhost:8984/fedora4/rest)
  * [Hyku beta.x](https://github.com/samvera-labs/hyku) at
  [http://localhost:8080](http://localhost:8080)
  * [Passenger](https://www.phusionpassenger.com/)
  * [Ruby 2.3.1](https://www.ruby-lang.org/)
  * [Solr 6.4.2](http://lucene.apache.org/solr/) at [http://localhost:8983/solr/](http://localhost:8983/solr/)
  * [Tomcat 7](http://tomcat.apache.org)
  * [Zookeeper](https://zookeeper.apache.org/)

## Windows Troubleshooting

If you receive errors involving `\r` (end of line):

Edit the global `.gitconfig` file, find the line:
```
autocrlf = true
```
and change it to
```
autocrlf = false
```
Remove and clone again. This will prevent windows git clients from automatically replacing unix line endings LF with windows line endings CRLF.

## Maintainers

Current maintainers:

* [Sean Watkins](https://github.com/seanlw)

## Thanks

This VM setup was heavily influenced from [Islandora 2.x VM](https://github.com/Islandora-Labs/islandora_vagrant).
