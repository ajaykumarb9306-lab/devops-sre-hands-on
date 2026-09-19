# Users and Groups

Current user:

```bash
whoami
id
```

View users:

```bash
cat /etc/passwd
```

Create user:

```bash
sudo useradd -m devopsuser
```

Set password:

```bash
sudo passwd devopsuser
```

Create group:

```bash
sudo groupadd devops
```

Add user:

```bash
sudo usermod -aG devops devopsuser
```

Verify:

```bash
id devopsuser
groups devopsuser
```

Switch user:

```bash
su - devopsuser
```

Delete user:

```bash
sudo userdel -r devopsuser
```