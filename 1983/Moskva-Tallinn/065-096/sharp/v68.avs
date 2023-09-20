import("..\1983-Moskva-Tallinn.avs")

v68 = LSMASHVideoSource(dst_dir + "v68rc.mp4")

v68 = v68.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v68 = v68.convertToYV12(interlaced=false)

v68 = v68.deScratch
v68 = v68.removeDirt

v68 = v68.UnsharpMask(strength=500, radius=5, threshold=1)
v68 = v68.adjustBorders

va = BlankClip(v68, audio_rate = 48000, channels = 2).killVideo
v68 = v68.audioDub(va)

return v68.Prefetch

