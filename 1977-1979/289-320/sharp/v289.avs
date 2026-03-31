import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v289 = LSMASHVideoSource(dst_dir + "v289rc.mp4")

v289 = v289.Filter(th_SAD=300, th_SADC=300, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v289 = v289.convertToYV12(interlaced=false)

v289 = v289.UnsharpMask(strength=500, radius=5, threshold=1)
v289 = v289.adjustBorders

va = BlankClip(v289, audio_rate = 48000, channels = 2).killVideo
v289 = v289.audioDub(va)

return v289.Prefetch

