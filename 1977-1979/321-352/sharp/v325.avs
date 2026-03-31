import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1977-1979.avs")
v325 = LSMASHVideoSource(dst_dir + "v325rc.mp4")

v325 = v325.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v325 = v325.convertToYV12(interlaced=false)

v325 = v325.UnsharpMask(strength=500, radius=5, threshold=1)
v325 = v325.adjustBorders

va = BlankClip(v325, audio_rate = 48000, channels = 2).killVideo
v325 = v325.audioDub(va)

return v325.Prefetch

