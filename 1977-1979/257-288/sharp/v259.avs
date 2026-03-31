import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v259 = LSMASHVideoSource(dst_dir + "v259rc.mp4")

v259 = v259.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v259 = v259.convertToYV12(interlaced=false)

v259 = v259.UnsharpMask(strength=500, radius=5, threshold=1)
v259 = v259.adjustBorders

va = BlankClip(v259, audio_rate = 48000, channels = 2).killVideo
v259 = v259.audioDub(va)

return v259.Prefetch

