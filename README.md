# Documentation
* [https://wsl.dev/wsl2-microk8s/](https://wsl.dev/wsl2-microk8s/)
* [https://kubernetes.io/blog/2020/05/21/wsl-docker-kubernetes-on-the-windows-desktop/](https://kubernetes.io/blog/2020/05/21/wsl-docker-kubernetes-on-the-windows-desktop/)
* [https://collabnix.com/kubernetes-dashboard-on-docker-desktop-for-windows-2-0-0-3-in-2-minutes/](https://collabnix.com/kubernetes-dashboard-on-docker-desktop-for-windows-2-0-0-3-in-2-minutes/)

### To get Kubernetes working with WSL:
1. Be sure you have wsl 2 enabled and a wsl distro installed and configured
2. Enable wsl suport in Docker Desktop. 
3. Open a wsl shell and run `docker` and `kubectl`. 
If each command shows help message WSL is properly integrated with Docker for Desktop. 
If not:
a) exit wsl shell 
b) run `wsl --shutdown` in cmd or powershell
c) if Docker for Desktop wants to restart WSL press Restart. Otherwise try to restart by right-clicking the Docker Tray icon
d) open wsl shell and verify once again the commands
4. Enable Kubernetes in Docker for Desktop GUI (dashboard)
5. Clone this repo in WSL and move into its directory. Then run:
`$ sh ./kub-setup-dashboard.sh`
6. Visit: http://localhost:8001/api/v1/namespaces/kubernetes-dashboard/services/https:kubernetes-dashboard:/proxy/ and use the token shown in the run results
7. Use `$ sh ./kub-get-secret.sh` whenever you need the token