# Load core libraries
for lib in $BASH_HOME/core/*.sh; do
    source $lib
done

# Load plugin libraries
for lib in $BASH_HOME/plugins/*.sh; do
    source $lib
done

# Load theme
[[ -f $BASH_HOME/themes/$BASH_THEME.theme.sh ]] && \
    source $BASH_HOME/themes/$BASH_THEME.theme.sh
