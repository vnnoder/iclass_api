pusher = Grocer.pusher(
    certificate: "#{Rails.root}/config/certs/certificate.pem",      # required
    passphrase:  "",                       # optional
    gateway:     "gateway.push.apple.com", # optional; See note below.
    #gateway:     "gateway.sandbox.push.apple.com.", # optional; See note below.
    port:        2195,                     # optional
    retries:     3                         # optional
)
notification = Grocer::Notification.new(
    device_token: "fe15a27d5df3c34778defb1f4f3880265cc52c0c047682223be59fb68500a9a2",
    alert:        "Hello from Grocer!",
    badge:        42,
    sound:        "siren.aiff",         # optional
    expiry:       Time.now + 60*60,     # optional; 0 is default, meaning the message is not stored
    identifier:   1234                  # optional
)

pusher.push(notification)
