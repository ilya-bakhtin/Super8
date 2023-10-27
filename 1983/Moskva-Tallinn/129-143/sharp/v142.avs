import("..\1983-Moskva-Tallinn.avs")

v142 = LSMASHVideoSource(dst_dir + "v142rc.mp4")

v142 = v142.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v142 = v142.convertToYV12(interlaced=false)

v142 = v142.deScratch
v142 = v142.removeDirt

v142 = v142.UnsharpMask(strength=500, radius=5, threshold=1)
v142 = v142.adjustBorders

va = BlankClip(v142, audio_rate = 48000, channels = 2).killVideo
v142 = v142.audioDub(va)

return v142.Prefetch

