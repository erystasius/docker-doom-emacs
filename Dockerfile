# Build from silex/emacs which is build on ubuntu.
FROM silex/emacs

# Install git.
RUN apt-get update && apt-get install -y git

# Create user with group and home directory, the user will be implicitly given uid 1000 and gid 1000.
RUN useradd --user-group --create-home emacser

# Run as the created user.
USER emacser:emacser

# Clone doom-emacs repo.
RUN git clone --depth 1 https://github.com/hlissner/doom-emacs ~/.emacs.d

# Install doom-emacs
RUN ~/.emacs.d/bin/doom install --no-env --no-fonts

# Set locale for utf-8 character display.
ENV LANG C.UTF-8

# Set terminfo for 256 color.
ENV TERM xterm-256color

# Set "emacs" as the command.
CMD ["emacs"]
