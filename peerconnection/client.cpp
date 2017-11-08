//
// Created by JiBen on 08/11/2017.
//

#include "rtc_base/ssladapter.h"
#include "api/audio_codecs/builtin_audio_decoder_factory.h"
#include "api/audio_codecs/builtin_audio_encoder_factory.h"
#include "api/peerconnectioninterface.h"
#include <iostream>

int main(int argc, char* argv[]) {
    rtc::InitializeSSL();

    auto peer_connection_factory_ = webrtc::CreatePeerConnectionFactory(
            webrtc::CreateBuiltinAudioEncoderFactory(),
            webrtc::CreateBuiltinAudioDecoderFactory());

    rtc::CleanupSSL();
    std::cout << "Done" << std::endl;
    return 0;
}
