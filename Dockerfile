FROM poobuntu:latest

RUN apt-fast install -y flatpak libasound2

#RUN sysctl kernel.unprivileged_userns_clone=1

#RUN useradd -ms /bin/bash signal-user
#USER signal-user
#WORKDIR /home/signal-user

#RUN flatpak remote-add --user --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
#RUN flatpak install --user -y flathub org.freedesktop.Platform/x86_64/19.08
#RUN flatpak install --user -y flathub org.signal.Signal
RUN flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
RUN flatpak install -y flathub org.freedesktop.Platform/x86_64/19.08
RUN flatpak install -y flathub org.signal.Signal

#USER root
#WORKDIR /
#RUN apt-fast purge --autoremove flatpak
RUN ./poobuntu-clean.sh
RUN rm -v poobuntu-clean.sh

#USER signal-user
#WORKDIR /home/signal-user
#CMD        ["/usr/bin/env", "signal-desktop"]
#ENTRYPOINT ["/usr/bin/env", "signal-desktop"]

CMD        ["/usr/bin/env", "flatpak", "run", "org.signal.Signal"]
ENTRYPOINT ["/usr/bin/env", "flatpak", "run", "org.signal.Signal"]

