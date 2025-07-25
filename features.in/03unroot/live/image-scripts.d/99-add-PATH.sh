#!/bin/bash
echo """
case "$PATH" in
	*:$HOME/bin|*:$HOME/bin:*|$HOME/bin:*) ;;
	*) PATH="$HOME/bin:$PATH" ;;
esac

case "$PATH" in
	*:$HOME/.local/bin|*:$HOME/.local/bin:*|$HOME/.local/bin:*) ;;
	*) PATH="$HOME/.local/bin:$PATH" ;;
esac
""" >> /etc/skel/.bashrc
