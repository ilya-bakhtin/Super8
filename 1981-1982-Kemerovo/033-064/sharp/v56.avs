import("..\..\common.avs")
import("..\..\s8_functions.avs")
import("..\1981-1982-Kemerovo.avs")
v56 = LSMASHVideoSource(dst_dir + "v56rc.mp4")

v56 = v56.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v56 = v56.convertToYV12(interlaced=false)

v56 = v56.UnsharpMask(strength=500, radius=5, threshold=1)
v56 = v56.adjustBorders

va = BlankClip(v56, audio_rate = 48000, channels = 2).killVideo
v56 = v56.audioDub(va)

return v56.Prefetch

