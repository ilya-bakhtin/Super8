import("..\1983-Moskva-Tallinn.avs")

v119 = LSMASHVideoSource(dst_dir + "v119rc.mp4")

v119 = v119.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v119 = v119.convertToYV12(interlaced=false)

v119 = v119.deScratch
v119 = v119.removeDirt

v119 = v119.UnsharpMask(strength=500, radius=5, threshold=1)
v119 = v119.adjustBorders

va = BlankClip(v119, audio_rate = 48000, channels = 2).killVideo
v119 = v119.audioDub(va)

return v119.Prefetch

