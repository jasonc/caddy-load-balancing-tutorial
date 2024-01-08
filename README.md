### Tutorial: [Load Balancing with Caddy](https://www.linuxtrainingacademy.com/caddy-load-balancing-tutorial/)

#### Overview:
- **Purpose**:
	- Learn how to use [Caddy](https://caddyserver.com/) as a web load balancer.
- **Environment**:
	- lb01 (load balancer)
	- web01 (web server)
	- web02 (web server)
- **Tools**:
	- [Caddy](https://caddyserver.com/) for load balancing and web serving.
	- [Vagrant](https://www.vagrantup.com/) for VM creation. (Optional)

#### Cloning the Tutorial Repository:

- **Command to Clone the Repository**:

     ```
     git clone https://github.com/jasonc/caddy-load-balancing-tutorial.git
     ```

- **Change into the Project Directory**:

     ```
     cd caddy-load-balancing-tutorial
     ```

#### Vagrant:
- **Vagrantfiles**:
	- `Vagrantfile`:
		-  Automates the installation and configuration of the virtual machines, web servers, and load balancer.
	- `Vagrantfile.vms`:
		- Creates the virtual machines, but does not install Caddy or perform any configuration.
		- To use, replace Vagrantfile with Vagrantfile.vms:

             ```
             cp Vagrantfile.vms Vagrantfile
             ```

- **Virtual Machine Creation**:
`vagrant up`

#### Caddy Configuration Files:
- **Caddyfile.random**
	- Default random load balancing policy.
- **Caddyfile.ip_hash**
	- For IP hash load balancing policy.
- **Caddyfile.rr**
	- For round-robin load balancing policy.

#### Automated Installation Script (`install.sh`):
- Adds the Caddy stable repository.
- Installs Caddy on all nodes.
- Configures lb01 with the random load balacing policy by using the `Caddyfile.random` configuration file.
- Sets up web server hostname in `index.html` on web01 and web02.

#### Manual Setup Steps (if not using install.sh):
- Install and Configure Caddy Manually:
	- Follow the steps in the `install.sh` script for each server.

#### Load Balancing Configurations:
- **Switching Load Balancer Configurations**:
	- Copy the desired Caddyfile to `/etc/caddy/Caddyfile` on lb01:

        ```
        cp Caddyfile.rr /etc/caddy/Caddyfile
        # or
        cp Caddyfile.ip_hash /etc/caddy/Caddyfile
        # or
        cp Caddyfile.random /etc/caddy/Caddyfile
        ```

	- Reload Caddy:

         ```
         sudo systemctl reload caddy
         ```

#### Testing Load Balancer:
- From the command line, use `curl` to test different load balancing policies:

    ```
    curl localhost
    ```
	  
    Or
	  
    ```
    curl 192.168.56.50   # the public facing IP of lb01
    ```

#### Additional Resources:
- [LinuxTrainingAcademy.com Video Lesson](https://www.linuxtrainingacademy.com/caddy-load-balancing-tutorial/)
- [Caddy installation documentation.](https://caddyserver.com/docs/install)
- [Caddy reverse proxy documentation, including load balancing policies.](https://caddyserver.com/docs/caddyfile/directives/reverse_proxy)

