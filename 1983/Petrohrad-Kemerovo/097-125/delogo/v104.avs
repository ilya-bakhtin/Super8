import("..\..\s8_functions.avs")
import("..\1983-Petrohrad-Kemerovo.avs")

va = BlankClip(v104, audio_rate = 48000, channels = 2).killVideo
v104 = v104.audioDub(va)

last = v104
prefetch

