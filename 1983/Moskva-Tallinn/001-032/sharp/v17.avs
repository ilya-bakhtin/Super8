import("..\1983-Moskva-Tallinn.avs")
v17 = LSMASHVideoSource(dst_dir + "v17rc.mp4")

v17 = v17.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v17 = v17.convertToYV12(interlaced=false)

v17 = v17.deScratch
v17 = v17.removeDirt

v17 = v17.UnsharpMask(strength=400, radius=5, threshold=1)
v17 = v17.adjustBorders

va = BlankClip(v17, audio_rate = 48000, channels = 2).killVideo
v17 = v17.audioDub(va)

return v17.Prefetch

