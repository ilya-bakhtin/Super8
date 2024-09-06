import("..\common.avs")
import("..\..\s8_functions.avs")
import("..\1987-svatba.avs")
v21 = LSMASHVideoSource(dst_dir + "v21rc.mp4")

v21 = v21.Filter(th_SAD=900, th_SADC=900, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v21 = v21.convertToYV12(interlaced=false)

v21 = v21.UnsharpMask(strength=500, radius=5, threshold=1)
v21 = v21.adjustBorders

v21 = v21.autolevels(input_low = 0, output_low = 0, input_high = 255, output_high = 248)

va = BlankClip(v21, audio_rate = 48000, channels = 2).killVideo
v21 = v21.audioDub(va)

return v21.Prefetch

