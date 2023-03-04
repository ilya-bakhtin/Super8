import("..\1983-Moskva-Tallinn.avs")
v27 = LSMASHVideoSource(dst_dir + "v27rc.mp4")

v27 = v27.Filter(th_SAD=500, th_SADC=0, dct=1, tr=3, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v27 = v27.convertToYV12(interlaced=false)

v27 = v27.deScratch
v27 = v27.removeDirt

v27 = v27.UnsharpMask(strength=400, radius=5, threshold=1)
v27 = v27.adjustBorders

va = BlankClip(v27, audio_rate = 48000, channels = 2).killVideo
v27 = v27.audioDub(va)

return v27.Prefetch

