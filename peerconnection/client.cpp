//
// Created by JiBen on 08/11/2017.
//

#include "rtc_base/thread.h"
#include "rtc_base/ssladapter.h"
#include "api/audio_codecs/builtin_audio_decoder_factory.h"
#include "api/audio_codecs/builtin_audio_encoder_factory.h"
#include "api/peerconnectioninterface.h"
#include "rtc_base/physicalsocketserver.h"
#include "rtc_base/asyncsocket.h"
#include <iostream>


class CustomSocketServer : public rtc::PhysicalSocketServer {
public:
    virtual ~CustomSocketServer() {}


    void SetMessageQueue(rtc::MessageQueue* queue) override {
        message_queue_ = queue;
    }


    // Override so that we can also pump the GTK message loop.
    virtual bool Wait(int cms, bool process_io) {
        return rtc::PhysicalSocketServer::Wait(0/*cms == -1 ? 1 : cms*/,
                                               process_io);
    }

protected:
    rtc::MessageQueue* message_queue_;
};

int main(int argc, char* argv[]) {
    rtc::InitializeSSL();

//    auto peer_connection_factory_ = webrtc::CreatePeerConnectionFactory(
//            webrtc::CreateBuiltinAudioEncoderFactory(),
//            webrtc::CreateBuiltinAudioDecoderFactory());

    CustomSocketServer socket_server;
    rtc::AutoSocketServerThread thread(&socket_server);

    thread.Run();

    rtc::CleanupSSL();
    return 0;
}
