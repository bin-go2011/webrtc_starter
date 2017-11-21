#include "rtc_base/sigslot.h"
#include <iostream>

using namespace sigslot;

class Swith
{
public:
    signal0<> Clicked;
};

class Light: public has_slots<>
{
public:
    void ToggleState() {
        std::cout << "Toggle State" << std::endl;
    }
};

int main(int argc, char* argv[]) {
    Swith sw1;
    Light lp1;
    sw1.Clicked.connect(&lp1, &Light::ToggleState);
    sw1.Clicked();
}