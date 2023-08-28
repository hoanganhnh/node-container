FROM node:16.20.2

LABEL maintainer=hoahoanganh20012001@gmail.com

COPY setups/* /tmp/setups

# RUN chmod +x docker-custom-entrypoint.sh
RUN chmod +x /tmp/setups
# RUN bash /tmp/setups/bash-custom.sh

# RUN bash /tmp/setups/user.sh

# ENTRYPOINT ["/docker-custom-entrypoint.sh"]

USER node
