import("..\1983-Moskva-Tallinn.avs")
v43 = LSMASHVideoSource(dst_dir + "v43rc.mp4")

v43 = v43.Filter(th_SAD=300, th_SADC=300, dct=1, tr=9, RefineMotion=false, contrasharp=false, blksize=16, overlap=8,\
                               truemotion=false, sigma_y=0, sigma_c=0, fft_sharp=0)

v43 = v43.convertToYV12(interlaced=false)

v43 = v43.deScratch
v43 = v43.removeDirt

v43 = v43.UnsharpMask(strength=500, radius=5, threshold=1)
v43 = v43.adjustBorders

va = BlankClip(v43, audio_rate = 48000, channels = 2).killVideo
v43 = v43.audioDub(va)

return v43.Prefetch

