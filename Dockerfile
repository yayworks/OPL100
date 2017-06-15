FROM ipoddaribm/powerai-examples

ADD ./NAE/help.html /etc/NAE/help.html

COPY ./yb-config-base.sh /usr/local/yb-config-base.sh
COPY ./jupyterhub_config.py /usr/local/jupyterhub_config.py
COPY ./startDL.sh /root/startDL.sh

RUN chmod +x /usr/local/yb-config-base.sh \
&&  chmod +x /root/startDL.sh 

COPY ./.bashrc /etc/skel/.bashrc

#add NIMBIX application
COPY AppDef.json /etc/NAE/AppDef.json
RUN curl --fail -X POST -d @/etc/NAE/AppDef.json https://api.jarvice.com/jarvice/validate

USER nimbix
WORKDIR /home/nimbix

COPY ./install_wetty.sh /home/nimbix/install_wetty.sh
COPY ./install_XLCompilers.sh /home/nimbix/install_XLCompilers.sh
COPY ./install_LAMP.sh /home/nimbix/install_LAMP.sh
COPY ./install_jhub.sh /home/nimbix/install_jhub.sh

RUN chmod +x /home/nimbix/install_wetty.sh \
&&  chmod +x /home/nimbix/install_XLCompilers.sh \
&&  chmod +x /home/nimbix/install_LAMP.sh \
&&  chmod +x /home/nimbix/install_jhub.sh \


&& sudo /home/nimbix/install_wetty.sh \
&& sudo /home/nimbix/install_XLCompilers.sh \


&&  sudo echo 'export PATH=/usr/local/node/bin:/usr/local/cuda/bin:/opt/ibm/xlC/13.1.5/bin:/opt/ibm/xlf/15.1.5/bin:$PATH' >> .bashrc \
&&  sudo echo 'export PATH=/usr/local/node/bin:/usr/local/cuda/bin:/opt/ibm/xlC/13.1.5/bin:/opt/ibm/xlf/15.1.5/bin:$PATH' >> /etc/bash.bashrc \


&& sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/' /etc/ssh/sshd_config 

##&& sudo service ssh restart 
##&&  sudo /home/nimbix/install_LAMP.sh \
##&&  sudo /home/nimbix/install_jhub.sh \

##WORKDIR /
##RUN /usr/bin/wget https://s3.amazonaws.com/yb-lab-cfg/ybcloud_v0.92.tar.gz
##RUN sudo tar xfpvz ybcloud_v0.92.tar.gz




