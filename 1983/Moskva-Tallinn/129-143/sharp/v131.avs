import("..\1983-Moskva-Tallinn.avs")

v131 = LSMASHVideoSource(dst_dir + "v131rc.mp4")

v131 = v131.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v131 = v131.convertToYV12(interlaced=false)

v131 = v131.deScratch
v131 = v131.removeDirt

v131 = v131.UnsharpMask(strength=500, radius=5, threshold=1)
v131 = v131.adjustBorders

va = BlankClip(v131, audio_rate = 48000, channels = 2).killVideo
v131 = v131.audioDub(va)

return v131.Prefetch

