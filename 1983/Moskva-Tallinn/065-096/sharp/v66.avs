import("..\1983-Moskva-Tallinn.avs")

v66 = LSMASHVideoSource(dst_dir + "v66rc.mp4")

v66 = v66.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v66 = v66.convertToYV12(interlaced=false)

v66 = v66.deScratch
v66 = v66.removeDirt

v66 = v66.UnsharpMask(strength=500, radius=5, threshold=1)
v66 = v66.adjustBorders

va = BlankClip(v66, audio_rate = 48000, channels = 2).killVideo
v66 = v66.audioDub(va)

return v66.Prefetch

